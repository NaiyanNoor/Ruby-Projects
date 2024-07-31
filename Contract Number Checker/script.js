document.getElementById('contractForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent default form submission
    
    const contractNumber = document.getElementById('contractInput').value;

    fetch('/check_contract', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ contract_number: contractNumber })
    })
    .then(response => response.json())
    .then(data => {
        document.getElementById('result').textContent = data.message;
    })
    .catch(error => {
        console.error('Error:', error);
    });
});
