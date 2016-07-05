sleep 5

if curl web:8080 | grep -1 '<h2>Visits:</h2> '; then
    echo "Tests passed!"
    exit 0
else
    echo "Tests failed!"
    exit 1
fi

