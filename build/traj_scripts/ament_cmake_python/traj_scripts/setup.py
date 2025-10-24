from setuptools import find_packages
from setuptools import setup

setup(
    name='traj_scripts',
    version='0.1.0',
    packages=find_packages(
        include=('traj_scripts', 'traj_scripts.*')),
)
