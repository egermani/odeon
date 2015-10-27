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
  handleCritiqueSubmit: function(critique) {
    var critiques = this.state.data;
    var newCritiques = critiques.concat([critique]);
    this.setState({data: newCritiques});
    $.ajax({
      url: "/reviews/" + this.props.review_num + "/critiques",
      dataType: 'json',
      type: 'POST',
      data: critique,
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  getInitialState: function() {
    return {data: JSON.parse(this.props.data)};
  },
  // componentDidMount: function() {
  //   this.loadCommentsFromServer();
  //   setInterval(this.loadCommentsFromServer, this.props.pollInterval);
  // },
  render: function() {
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

// var CritiqueForm = React.createClass({
//   handleSubmit: function(e) {
//     e.preventDefault();
//     var title = this.refs.title.value.trim();
//     var body = this.refs.body.value.trim();
//     var keypoint_id = this.refs.keypoint_id.value.trim();
//     if (!body || !title) {
//       return;
//     }
//     this.props.onCritiqueSubmit({critique: {title:title, body: body, keypoint_id: keypoint_id}});
//     this.refs.title.value = '';
//     this.refs.body.value = '';
//     this.refs.keypoint_id.value = '';
//   },
//   render: function() {
//     return (
//       <form className="commentForm" onSubmit={this.handleSubmit}>
//         <input type="text" placeholder="Title" ref="title" />
//         <textarea rows="5" cols="50" type="text" placeholder="Compose critique..." ref="body"></textarea>
//         <input type="text" placeholder="Keypoint" ref="keypoint_id"/>
//         <input type="submit" value="Post" />
//       </form>
//     );
//   }
// });



// ReactDOM.render(
//   // var pathArray = window.location.pathname.split( '/' );
//   // console.log(pathArray);
//   <CritiqueBox data={data} />,
//   document.getElementById('critiques-container')
// );