FROM python:3

RUN useradd --create-home --shell /bin/bash robot

WORKDIR /home/robot

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY tests tests
RUN chmod og=rX -R tests

USER robot

ENTRYPOINT ["robot", "--outputdir", "results"]