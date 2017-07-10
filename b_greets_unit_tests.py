from tornado.testing import AsyncHTTPTestCase
import b_greets

class TestHelloApp(AsyncHTTPTestCase):
    def get_app(self):
        return b_greets.make_app()

    def test_homepage(self):
        response = self.fetch('/')
        self.assertEqual(response.code, 200)
        self.assertEqual(response.body, 'Hello, world')

if __name__ == '__main__':
    import unittest
    unittest.main()
