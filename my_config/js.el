<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>First Component</title>
    <script src="http://fb.me/react-0.11.1.js"></script>
    <script src="http://fb.me/JSXTransformer-0.11.1.js"></script>
</head>
<body>
<script type="text/jsx">
    /*** @jsx React.DOM */
    var APP = React.createClass({
        render:function(){
            return (
                <h1>Hello React</h1>
            )
        }
    });

    React.renderComponent(<APP />, document.body)
</script>
</body>
</html>
