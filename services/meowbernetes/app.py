from flask import Flask, request
from datetime import datetime
import requests

app = Flask(__name__)


@app.route('/hellocat')
def hello_cats():
    current_time = datetime.utcnow().isoformat() + 'Z'
    headers = request.headers

    header_html = ""
    for k, v in headers.items():
        header_html += f"<li>{k}: {v}</li>"

    try:
        response = requests.get(
            url='https://cataas.com/cat',
            timeout=5
        )
        if response.status_code == 200:
            cat_image_url = response.url
            cat_html = f'<img src="{cat_image_url}" alt="Random Cat" />'
        else:
            raise Exception("Non-successful response code received.")
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
    app.run(
        host='127.0.0.1',
        port=8080
    )
