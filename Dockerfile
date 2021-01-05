FROM nnurphy/ub

ENV PYTHONUNBUFFERED=x

RUN set -eux \
  #; apt-get update -y \
  #; DEBIAN_FRONTEND=noninteractive \
  #  apt-get install -y --no-install-recommends \
  #  python3 python3-pip python3-setuptools ipython3 \
  #; apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* \
  ; pip3 --default-timeout=100 --no-cache-dir install ptvsd \
        fastapi uvicorn Requests furl html5lib \
        aiohttp aiohttp-requests \
        PyParsing decorator more-itertools \
        fabric typer hydra-core pyyaml \
        cachetools transitions chronyk fn.py \
        SciPy SymPy Numpy numexpr Pandas \
        Statsmodels matplotlib Scikit-learn \
  ; pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
