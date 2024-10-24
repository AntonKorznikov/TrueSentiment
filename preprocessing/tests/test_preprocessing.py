# test_preprocessing.py

import unittest
import os
import shutil
from preprocessing import preprocess

class TestPreprocessing(unittest.TestCase):
    def setUp(self):
        self.input_raw = 'examples/test_input_raw'
        self.input = 'examples/test_input'
        os.makedirs(self.input_raw, exist_ok=True)
        with open(os.path.join(self.input_raw, 'test.txt'), 'w') as f:
            f.write("Test content.")
    
    def tearDown(self):
        shutil.rmtree(self.input_raw)
        if os.path.exists(self.input):
            shutil.rmtree(self.input)
    
    def test_preprocess(self):
        preprocess()
        self.assertTrue(os.path.exists(self.input))
        self.assertTrue(os.path.isfile(os.path.join(self.input, 'test.txt')))

if __name__ == '__main__':
    unittest.main()