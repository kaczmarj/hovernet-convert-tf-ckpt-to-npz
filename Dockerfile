FROM python:3.6-slim
RUN pip install --no-cache-dir \
        tensorflow==1.12.0 \
        tensorpack==0.9.0.1
WORKDIR /opt/hovernet-tf-to-npz/
COPY convert-tf-to-npz.py ./
ENTRYPOINT ["python", "convert-tf-to-npz.py"]
