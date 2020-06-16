set -x PATH $PATH /usr/local/go/bin /home/solidity/bin /home/solidity/.npm_modules/bin /home/solidity/go/bin /snap/bin /home/solidity/.local/bin /media/solidity/DATA/anaconda/bin /home/solidity/.pyenv/bin /usr/local/cuda-11.0/bin
set -x GOPATH $HOME/go
set -x GOPRIVATE "github.com/RTradeLtd/*"
set -x CODE_DIR "/media/solidity/DATA/Code"
set -x EXT_DIR  "/media/solidity/DATA"
set -x TRILIUM_DATA_DIR "/media/solidity/DATA/trilium"
set -x PYENV_ROOT $HOME/.pyenv
set -x CGO_LDFLAGS "-L/media/solidity/DATA/deepspeech/lib/"
set -x CGO_CXXFLAGS "-I/media/solidity/DATA/deepspeech/include/"
set -x LD_LIBRARY_PATH "/media/solidity/DATA/deepspeech/lib/:/usr/lib/cuda/lib64/:LD_LIBRARY_PATH"
