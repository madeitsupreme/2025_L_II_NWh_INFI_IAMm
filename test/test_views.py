import unittest
from hello_world import app
from hello_world.formater import SUPPORTED


class FlaskrTestCase(unittest.TestCase):
    def setUp(self):
        app.config['TESTING'] = True
        self.app = app.test_client()

    def test_outputs(self):
        rv = self.app.get('/outputs')
        s = str(rv.data)
        ','.join(SUPPORTED) in s

    def test_msg_with_output(self):
    rv = self.app.get('/?output=json')
    data = json.loads(rv.data)  # parse JSON from response
    expected = {
        "imie": "Dominik",
        "msg": "Hello World!"
    }
    self.assertEqual(data, expected)
