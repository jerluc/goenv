# This file must be used with "source bin/activate" or ". bin/activate"

GOENV_NAME='{{.name}}'
GOENV_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ "$GOENV_ACTIVE" == "1" ]]; then
	deactivate
fi

export GOENV_ACTIVE=1
export GOENV_PS1=$PS1
export GOENV_GOPATH=$GOPATH
export GOENV_PATH=$PATH

export GOPATH="$GOENV_DIR/$GOENV_NAME:$GOPATH"
export PATH="$GOENV_DIR/bin:$PATH"
export PS1="(${GOENV_NAME})${PS1}"

deactivate() {
	export PS1=$GOENV_PS1
	export GOPATH=$GOENV_GOPATH
	export PATH=$GOENV_PATH

	unset GOENV_ACTIVE GOENV_PS1 GOENV_PATH GOENV_GOPATH
	unset -f deactivate
}
