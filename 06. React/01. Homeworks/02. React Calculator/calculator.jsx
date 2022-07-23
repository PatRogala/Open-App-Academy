import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      result: 0,
      num1: '',
      num2: ''
    }
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.addNumbers = this.addNumbers.bind(this);
    this.subtractNumbers = this.subtractNumbers.bind(this);
    this.multiplyNumbers = this.multiplyNumbers.bind(this);
    this.divideNumbers = this.divideNumbers.bind(this);
    this.reset = this.reset.bind(this);
  }

  setNum1(e) {
    this.setState({num1: e.target.value});
  }

  setNum2(e) {
    this.setState({num2: e.target.value});
  }

  addNumbers(e) {
    e.preventDefault();
    this.setState({result: parseInt(this.state.num1) + parseInt(this.state.num2)});
  }

  subtractNumbers(e) {
    e.preventDefault();
    this.setState({result: parseInt(this.state.num1) - parseInt(this.state.num2)});
  }

  multiplyNumbers(e) {
    e.preventDefault();
    this.setState({result: parseInt(this.state.num1) * parseInt(this.state.num2)});
  }

  divideNumbers(e) {
    e.preventDefault();
    this.setState({result: parseInt(this.state.num1) / parseInt(this.state.num2)});
  }

  reset() {
    this.setState({result: 0, num1: '', num2: ''});
  }

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1} value={this.state.num1} placeholder="Num 1" />
        <input onChange={this.setNum2} value={this.state.num2} placeholder="Num 2" />
        <button onClick={this.addNumbers}>+</button>
        <button onClick={this.subtractNumbers}>-</button>
        <button onClick={this.multiplyNumbers}>*</button>
        <button onClick={this.divideNumbers}>/</button>
        <button onClick={this.reset}>Reset</button>
      </div>
    );
  }
}

export default Calculator;
