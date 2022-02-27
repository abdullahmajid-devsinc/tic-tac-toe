import logo from './logo.svg';
import './App.css';

function App() {
  const [board, setBoard] = useState();
  const resetBoard = () => {
    axios({
      method: 'post',
      url: `${BASE_URL}authorization/google`,
      data: requestOptions
    })
      .then((response) => {
        localStorage.setItem('access-token', response.headers['access-token'])
        localStorage.setItem('client', response.headers.client)
        localStorage.setItem('uid', response.headers.uid)

        // verifyCredentials(configureStore())

        window.location.reload()
      })
      .catch((error) => {
        dispatch(googleAuthFailure(error))
      })
  }

  useEffect(() => {
    // Update the document title using the browser API
    document.title = `You clicked ${count} times`;
  });

  return (
    <div className="App">
      <form onSubmit={resetBoard}>
        <label>
          Player 1:
          <input type="text" name="player1" />
        </label>
        <label>
          Player 2:
          <input type="text" name="player2" />
        </label>
        <input type="submit" value="Submit" />
      </form>
    </div>
  );
}

export default App;
