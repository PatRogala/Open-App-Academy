import React from 'react';

class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      city: '',
      temperature: '',
    };
    this.getWeather = this.getWeather.bind(this);
  }

  componentDidMount() {
    this.position = navigator.geolocation.getCurrentPosition(
      (position) => {
        const lat = position.coords.latitude;
        const lon = position.coords.longitude;
        this.getWeather(lat, lon);
      });
  }

  getWeather(lat, lon) {
    const request = new XMLHttpRequest();
    const url = `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&APPID=${process.env.REACT_APP_API_KEY}`;

    request.open('GET', url, true);

    request.onload = () => {
      if (request.status >= 200 && request.status < 400) {
        const data = JSON.parse(request.responseText);
        this.setState({
          city: data.name,
          temperature: data.main.temp,
        });
      }
    }

    request.send();
  }

  render() {
    const { city, temperature } = this.state;
    return (
      <div>
        <h1>Weather</h1>
        <div className="weather">
          <div>
            <p>{city}</p>
            <p><span>{temperature}</span><span>degrees</span></p>
          </div>
        </div>
      </div>
    );
  }
}

export default Weather;
