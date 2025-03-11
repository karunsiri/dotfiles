ASDF_VERSION=v0.16.5
ASDF_DATA_DIR=$HOME/.asdf

PATH="$PATH:${ASDF_DATA_DIR}:${ASDF_DATA_DIR}/shims"

function download_mac() {
  curl -L -o /tmp/asdf.tar.gz \
    https://github.com/asdf-vm/asdf/releases/download/${ASDF_VERSION}/asdf-${ASDF_VERSION}-darwin-arm64.tar.gz
  tar -xzvf /tmp/asdf.tar.gz -C $ASDF_DATA_DIR asdf
  rm /tmp/asdf.tar.gz
}

function download_linux() {
  curl -L -o /tmp/asdf.tar.gz \
    https://github.com/asdf-vm/asdf/releases/download/${ASDF_VERSION}/asdf-${ASDF_VERSION}-linux-amd64.tar.gz
  tar -xzvf /tmp/asdf.tar.gz -C $ASDF_DATA_DIR asdf
  rm /tmp/asdf.tar.gz
}

function load_asdf() {
  mkdir -p $ASDF_DATA_DIR

  if [ ! -f "${ASDF_DATA_DIR}/completions/_asdf" ]; then
    echo "Installing ASDF completions..."
    mkdir -p "${ASDF_DATA_DIR}/completions"
    asdf completion zsh > "${ASDF_DATA_DIR}/completions/_asdf"
  fi

  fpath=(${ASDF_DATA_DIR}/completions $fpath)
  autoload -Uz compinit
}

if ! command -v asdf &> /dev/null; then
  echo "Downloading ASDF ${ASDF_VERSION} into ${ASDF_DATA_DIR}..."

  # Detect OS
  if [[ $OSTYPE == 'linux'* ]]; then
    download_linux
  else
    # assumes darwin (macOS)
    download_mac
  fi
fi

load_asdf
