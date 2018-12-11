# tskit-workshop
JupyterHub infrastructure for tskit workshops

Usage:

- Clone the repo.

- Build the docker image: ``docker build -t tskit-workshop . --network host``. (The --network host is probably not needed in most cases, but it worked around very tricky networking issues I was having during build.)

- Test out the docker image: ``docker run -p 8888:8888 tskit-workshop``
