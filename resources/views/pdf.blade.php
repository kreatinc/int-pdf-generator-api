<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <style>
        @font-face {
            font-family: 'OpenSans';
            src: url({{ public_path('fonts\OpenSans-Regular.ttf') }}) format("truetype");
            font-weight: 400;
            font-style: normal;
        }

        @page {
            margin: 0;
        }

        body {
            margin: 2em;
            font-family: "OpenSans";
        }

        /** Define the header rules **/
        header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 2em;

            /** Extra personal styles **/
            background-color: #03a9f4;
            color: white;
            text-align: center;
        }

        /** Define the footer rules **/
        footer {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            height: 2em;
            /** Extra personal styles **/
            background-color: #03a9f4;
            color: white;
            text-align: center;
        }
        main {
            padding-top: 20px;
            padding-bottom: 20px;
        }
    </style>
</head>
<body>
<header>Here will be the header</header>
<footer>Here will be the footer</footer>
<main>
        {!! $body !!}
</main>
</body>
</html>