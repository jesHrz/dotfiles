function proxyon() {
  PORT=20171
	export ALL_PROXY="http://127.0.0.1:${PORT}"
	export HTTP_PROXY="http://127.0.0.1:${PORT}"
	export HTTPS_PROXY="http://127.0.0.1:${PORT}"
	echo "ALL_PROXY=$ALL_PROXY;HTTP_PROXY=$HTTP_PROXY;HTTPS_PROXY=$HTTPS_PROXY"
}

function proxyoff() {
	unset ALL_PROXY HTTP_PROXY HTTPS_PROXY
	echo "proxyoff"
}
