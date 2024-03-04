import time
import torch
import numpy as np
from mydebug.utils import multiply

print("Numpy version: ", np.__version__)
print("GPU available: ", torch.cuda.is_available())

print(multiply(3, 5))

print("Hello World!")
time.sleep(2)
print("Goodbye World!")
