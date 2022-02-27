import { useState } from 'react'

import Board from '../Board/Board'
import InitialForm from '../InitialForm/InitialForm'

import './Home.css';

function Home() {
  const [board, setBoard] = useState();
  const resetBoard = () => {
    setBoard()
  }

  return (
    <>
      {!board && <InitialForm  setBoard={setBoard} />}
      {board && <Board  resetBoard={resetBoard} board={board} />}
    </>
  );
}

export default Home;
