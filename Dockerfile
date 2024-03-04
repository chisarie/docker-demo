# For more information, please refer to https://aka.ms/vscode-docker-python
FROM nvcr.io/nvidia/pytorch:23.08-py3 AS torch_cuda_base

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Creates a non-root user: https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user
ARG USERNAME=appuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
# RUN groupadd --gid $USER_GID $USERNAME \
#     && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
#     # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
#     && apt-get update \
#     && apt-get install -y sudo \
#     && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
#     && chmod 0440 /etc/sudoers.d/$USERNAME

# # [Optional] Set the default user. Omit if you want to keep the default as root.
# USER $USERNAME

# Install pip requirements. Our editable code bind is located at the default location "/workspaces". 
# To change it, follow https://code.visualstudio.com/remote/advancedcontainers/change-default-source-mount
WORKDIR /docker-demo
ADD . /docker-demo
RUN pip install -r requirements.txt

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["python", "scripts/main.py"]
