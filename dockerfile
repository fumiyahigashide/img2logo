# 基本イメージの指定
FROM jupyter/base-notebook

# 作業ディレクトリの設定を /workspace に変更
WORKDIR /workspace

# 必要なツールのインストール
USER root
RUN apt-get update && apt-get install -y git

# ユーザーを notebook user に戻す (Jupyter Docker Stacks ではデフォルトユーザー名)
USER jovyan

# environment.ymlをコンテナにコピー
COPY environment.yml /workspace/environment.yml

# Conda環境の作成
RUN conda env create -f /workspace/environment.yml

# Conda環境をアクティベートするための新しいRUNコマンド
# `.bashrc` への追加ではなく、直接環境変数を設定
ENV PATH /opt/conda/envs/logo/bin:$PATH

# Conda環境をJupyterカーネルとして登録
RUN /bin/bash -c "source /opt/conda/etc/profile.d/conda.sh && \
    conda activate logo && \
    python -m ipykernel install --user --name logo --display-name 'Python (logo)'"

# ポート8888でJupyter Notebookを起動
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]

#docker run --gpus all -p 8888:8888 -v /home/fumiya/Working/logo:/workspace jupyter_logo
