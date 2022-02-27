import axios from 'axios'

function InitialForm(props) {
  const handleSubmit = (e) => {
    e.preventDefault();
    axios.post('http://localhost:3000/api/v1/boards/', {
      player1: e.target.player1.value,
      player2: e.target.player2.value
    })
    .then((response) => {
      props.setBoard(response.data)
    });
  }

  return (
    <div className='text-center'>
      <h1>Please Enter Player Names</h1>
      <form onSubmit={handleSubmit}>
        <div className="mt-2">
          <label>
            Player 1:
            <input type="text" name="player1" required/>
          </label>
        </div>
        <div className="mt-2">
          <label>
            Player 2:
            <input type="text" name="player2" required/>
          </label>
        </div>
        <input className="mt-2" type="submit" value="Submit" />
      </form>
    </div>
  );
}

export default InitialForm;