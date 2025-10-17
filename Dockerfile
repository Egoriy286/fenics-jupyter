# Dockerfile с Python 3.10, DOLFIN и DOLFINx без conda
FROM quay.io/fenicsproject/stable:current

USER root

# Настройка для неинтерактивной установки
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Обновляем pip и устанавливаем Jupyter Lab и дополнительные библиотеки
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
EXPOSE 8887

# Запуск Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8887", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
