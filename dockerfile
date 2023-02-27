FROM python

WORKDIR /app

COPY  . .

RUN "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip
RUN ./aws/install
RUN apt install zip -y
RUN pip install -r requirements.txt

CMD ["python","-m","flask", "run","--host=0.0.0.0"]