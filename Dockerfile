FROM nashv1/io

ENV PYTHONUNBUFFERED=x

RUN set -eux \
  #; apt-get update -y \
  #; DEBIAN_FRONTEND=noninteractive \
  #  apt-get install -y --no-install-recommends \
  #  python3 python3-pip python3-setuptools ipython3 \
  #; apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* \
  ; pip3 --default-timeout=100 --no-cache-dir install \
        fastapi uvicorn aiohttp Requests furl html5lib \
        PyParsing decorator more-itertools \
        fabric typer hydra-core pyyaml \
        cachetools transitions chronyk fn.py \
        SciPy SymPy Numpy numexpr Pandas \
        Statsmodels matplotlib Scikit-learn \
  \
  ; nvim_home=/etc/skel/.config/nvim \
  ; SKIP_CYTHON_BUILD=1 $nvim_home/plugged/vimspector/install_gadget.py --enable-python \
  ; rm -f $nvim_home/plugged/vimspector/gadgets/linux/download/debugpy/*/*.zip \
  ; pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
