import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {date: new Date()};
    this.tick = this.tick.bind(this);
  }

  tick() {
    this.setState({date: new Date()});
  }

  componentDidMount() {
    this.interval = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  render() {
    const {date} = this.state;
    let hours = date.getHours();
    let minutes = date.getMinutes();
    let seconds = date.getSeconds();
    const dayName = date.toLocaleString('en-US', {weekday: 'short', day: 'numeric', month: 'short', year: 'numeric'});
    hours = hours < 10 ? `0${hours}` : hours;
    minutes = minutes < 10 ? `0${minutes}` : minutes;
    seconds = seconds < 10 ? `0${seconds}` : seconds;

    return (
      <div>
        <h1>Clock</h1>
        <div className="clock">
          <p><span>Time:</span><span><span>{hours}</span><span>:</span><span>{minutes}</span><span>:</span><span>{seconds}</span></span></p>
          <p><span>Date: </span><span>{dayName}</span></p>
        </div>
      </div>
    );
  }
}

export default Clock;
