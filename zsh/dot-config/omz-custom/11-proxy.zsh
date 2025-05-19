function proxyon() {
  local port=20171
  local server="http://127.0.0.1:${port}"

  export ALL_PROXY="${server}" HTTPS_PROXY="${server}" HTTP_PROXY="${server}" NO_PROXY="localhost,127.0.0.1"
	echo "ALL_PROXY=${ALL_PROXY};HTTP_PROXY=${HTTP_PROXY};HTTPS_PROXY=${HTTPS_PROXY};NO_PROXY=${NO_PROXY}"
}

function proxyoff() {
  unset ALL_PROXY HTTP_PROXY HTTPS_PROXY NO_PROXY
  echo "proxyoff"
}
