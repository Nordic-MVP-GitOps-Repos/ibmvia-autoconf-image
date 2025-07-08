FROM python:3.13
           
RUN pip install setuptools
RUN pip install "cython<3.0.0" wheel
RUN pip install "pyyaml==5.4.1" --no-build-isolation
#RUN pip install ibmvia-autoconf

# Development version for now
ADD https://api.github.com/repos/thomas-mattsson/ibmvia_autoconf/git/refs/heads/development version.json
RUN git clone -b development https://github.com/thomas-mattsson/ibmvia_autoconf && \
  cd ibmvia_autoconf && \
  pip install -r dev-requirements.txt && \
  python -m build && \
  pip install dist/*.whl

CMD ["/bin/bash"]
