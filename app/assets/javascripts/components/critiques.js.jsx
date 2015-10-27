var CritiqueBox = React.createClass({
  // loadCommentsFromServer: function() {
  //   // $.ajax({
  //   //   url: this.props.url,
  //   //   dataType: 'json',
  //   //   cache: false,
  //   //   success: function(data) {
  //       this.setState({data: this.props.data});
  //   //   }.bind(this),
  //   //   error: function(xhr, status, err) {
  //   //     console.error(this.props.url, status, err.toString());
  //   //   }.bind(this)
  //   // });
  // },
  // handleCommentSubmit: function(comment) {
  //   var comments = this.state.data;
  //   var newComments = comments.concat([comment]);
  //   this.setState({data: newComments});
  //   $.ajax({
  //     url: this.props.url,
  //     dataType: 'json',
  //     type: 'POST',
  //     data: comment,
  //     success: function(data) {
  //       this.setState({data: data});
  //     }.bind(this),
  //     error: function(xhr, status, err) {
  //       console.error(this.props.url, status, err.toString());
  //     }.bind(this)
  //   });
  // },
  getInitialState: function() {
    return {data: JSON.parse(this.props.data)};
  },
  // componentDidMount: function() {
  //   this.loadCommentsFromServer();
  //   setInterval(this.loadCommentsFromServer, this.props.pollInterval);
  // },
  render: function() {
    console.log(this.state.data);
    return (
      <div className="critiqueBox">
        <h1>Critiques</h1>
        <CritiqueList data={this.state.data} />
      </div>
    );
  }
});

var Critique = React.createClass({
  render: function() {
    return (
      <div className="critique">
        <h2 className="critiqueTitle">
          {this.props.title}
        </h2>
        <span className="critiqueBody">{this.props.body}</span>
        <h3 className="critiqueAuthor">
          By: {this.props.username}
        </h3>
      </div>
    );
  }
});

var CritiqueList = React.createClass({

  render: function() {
    console.log(this.props.data[0]);
    var critiqueNodes = this.props.data.map(function(critique, index) {
      return (
        <Critique username={critique.user_id} title={critique.title} body={critique.body} />
      );
    });
    return (
      <div className="critiqueList">
        {critiqueNodes}
      </div>
    );
  }
});



// ReactDOM.render(
//   // var pathArray = window.location.pathname.split( '/' );
//   // console.log(pathArray);
//   <CritiqueBox data={data} />,
//   document.getElementById('critiques-container')
// );