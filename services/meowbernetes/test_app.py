import unittest
from unittest.mock import patch
import app


class TestApp(unittest.TestCase):

    def setUp(self):
        app.app.testing = True
        self.client = app.app.test_client()

    @patch('requests.get')
    def test_hello_cats_api_available(self, mock_get):
        mock_get.return_value.json.return_value = [{"url": "https://cdn2.thecatapi.com/images/cfu.jpg"}]
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'<img meowbernetes="https://cdn2.thecatapi.com/images/cfu.jpg" alt="Random Cat" />',
                      response.data)
        self.assertIn(b'Hello, cats!', response.data)

    @patch('requests.get')
    def test_hello_cats_api_unavailable(self, mock_get):
        mock_get.side_effect = Exception("API is down")
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b' /\_/\  ', response.data)
        self.assertIn(b'( o.o )', response.data)
        self.assertIn(b' > ^ <  ', response.data)
        self.assertIn(b'Hello, cats!', response.data)


if __name__ == '__main__':
    unittest.main()
