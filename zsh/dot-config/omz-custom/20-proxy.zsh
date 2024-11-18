function proxyon() {
	export ALL_PROXY="http://127.0.0.1:20171"
	echo "ALL_PROXY=$ALL_PROXY"
}

function proxyoff() {
	unset ALL_PROXY
	echo "proxyoff"
}
