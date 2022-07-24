import React from 'react';

class Autocomplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      inputVal: ""
    };
  }

  render() {
    const {names} = this.props;
    const {inputVal} = this.state;
    const namesToShow = names.filter(name => name.startsWith(inputVal));
    return (
      <div>
        <h1>Autocomplete</h1>
        <div className="auto">
          <input value={inputVal} placeholder="Search..." type="text" onChange={e => this.setState({inputVal: e.target.value})}/>
          <ul>
            {namesToShow.map(name => <span><li key={name} onClick={e => this.setState({inputVal: e.currentTarget.innerText})}>{name}</li></span>)}
          </ul>
        </div>
      </div>
    );
  }
}

export default Autocomplete;
