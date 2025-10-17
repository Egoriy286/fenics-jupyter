# Dockerfile с Python 3.10, DOLFIN и DOLFINx без conda
FROM fenics/stable:py3

USER root

# Настройка для неинтерактивной установки
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install build dependencies required by cffi
RUN apt-get update && apt-get install -y build-essential libffi-dev python3-dev

# Upgrade pip and install Jupyter Lab and additional libraries
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir \
    jupyterlab \
    notebook \
    ipywidgets \
    matplotlib \
    numpy \
    scipy \
    pandas

# Создаем рабочую директорию
WORKDIR /workspace

# Настраиваем права доступа
RUN chmod -R 777 /workspace

# Открываем порт для Jupyter Lab
EXPOSE 8888

# Запуск Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--NotebookApp.token='student123'", "--NotebookApp.password='student123'"]
