from setuptools import setup
from setuptools.dist import Distribution


class BinaryDistribution(Distribution):
    def has_ext_modules(foo):
        return True


setup(
    name='cv2',
    version='1.0',
    packages=['cv2'],
    include_package_data=True,
    distclass=BinaryDistribution,
)
