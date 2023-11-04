from flask import Flask, request
import requests
from os import getenv
from dotenv import load_dotenv
from datetime import datetime

load_dotenv()

app = Flask(__name__)

if not getenv('CAT_API_KEY'):
    raise EnvironmentError("The CAT_API_KEY environment variable must be set.")


@app.route('/hellocat')
def hello_cats():
    current_time = datetime.utcnow().isoformat() + 'Z'
    headers = request.headers

    header_html = ""
    for k, v in headers.items():
        header_html += f"<li>{k}: {v}</li>"

    try:
        api_key = getenv('CAT_API_KEY')
        response = requests.get('https://api.thecatapi.com/v1/images/search', headers={'x-api-key': api_key})
        json_response = response.json()
        cat_image_url = json_response[0]['url']
        cat_html = f'<img src="{cat_image_url}" alt="Random Cat" />'
    except Exception as e:
        print(f"An error occurred: {e}")
        cat_html = """<pre>
                 /\_/\  
                ( o.o ) 
                 > ^ <  
            </pre>"""

    return f"""<html>
        <body>
            {cat_html}
            <p>Hello, cats!</p>
            <p>Current Time: {current_time}</p>
            <ul>Request Headers:
                {header_html}
            </ul>
        </body>
    </html>"""


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
