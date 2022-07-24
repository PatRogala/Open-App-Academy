import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedTab: 0
    };
  }

  render() {
    const {selectedTab} = this.state;
    const {tabs} = this.props;
    return (
      <div>
        <h1>Tabs</h1>
        <div className="tabs">
          <div className="tab-header">
            <ul>
              {tabs.map((tab, index) => (
                <li key={index} className={index === selectedTab ? 'selected' : ''} onClick={() => this.setState({selectedTab: index})}>
                  {tab.title}
                </li>
              ))}
            </ul>
          </div>
          <article className="tab-content">
            <p>{tabs[selectedTab].content}</p>
          </article>
        </div>
      </div>
    );
  }
}

export default Tabs;
