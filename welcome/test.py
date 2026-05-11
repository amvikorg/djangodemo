from urllib import response

from django.test import TestCase

class SimpleTest(TestCase):
    def test_homepage(self):
        response = self.client.get("/")
        self.assertEqual(response.status_code,200)
    
    def test_contactpage(self):
        response = self.client.get(path="/contact")
        self.assertEqual(response.status_code,200)
