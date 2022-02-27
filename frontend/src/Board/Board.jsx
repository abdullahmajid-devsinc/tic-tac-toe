import axios from 'axios'
import { useState } from 'react'

import './Board.css';

function Board(props) {
  const [values, setValues] = useState(Array(9).fill(null))
  const [player, setPlayer] = useState(0)
  const [winner, setWinner] = useState()
  const symbols =  ["X", "O"]
  const { board, resetBoard } = props

  const handleCellClick = (e) => {
    let cell = parseInt(e.target.dataset.cellIndex)
    if (!!values[cell] || !!winner) return;

    let player_id = null;
    if (player%2 == 0) {
      player_id = props.board.player1_id
    } else {
      player_id = props.board.player2_id
    }

    axios.post(`http://localhost:3000/api/v1/boards/${board.id}/moves`, {
      move: {  player_id: player_id, cell: cell }
    })
    .then((response) => {
      let tempValues = [...values]
      tempValues[cell] = symbols[player%2]
      setValues(tempValues)
      setPlayer((player+1)%2)
      setWinner(response.data.winner)

    });
  }

  const arr = () => {
    return values.map((e, i) => (<div className="cell" onClick={handleCellClick} data-cell-index={i} key={i}>{e}</div>))
  }

  return (
    <>
      <div className="text-center">
        <button onClick={resetBoard}>Click to Restart</button>
        {winner && <h1>{winner.name} has won!</h1>}
        <div className="board">
          {arr()}
        </div>
      </div>
    </>
  )
}

export default Board;