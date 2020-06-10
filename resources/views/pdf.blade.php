<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="{{ public_path()."/css/style.css" }}">
    <style>
        @font-face {
            font-family: 'OpenSans';
            src: url({{ public_path()."/fonts/OpenSans-Bold.ttf" }}) format("truetype");
            font-weight: bold;
            font-style: normal;
        }
        @font-face {
            font-family: 'OpenSans';
            src: url({{ public_path()."/fonts/OpenSans-BoldItalic.ttf" }}) format("truetype");
            font-weight: bold;
            font-style: italic;
        }
        @font-face {
            font-family: 'OpenSans';
            src: url({{ public_path()."/fonts/OpenSans-ExtraBold.ttf" }}) format("truetype");
            font-weight: bold;
            font-style: normal;
        }
        @font-face {
            font-family: 'OpenSans';
            src: url({{ public_path()."/fonts/OpenSans-ExtraBoldItalic.ttf" }}) format("truetype");
            font-weight: bold;
            font-style: italic;
        }
        @font-face {
            font-family: 'OpenSans';
            src: url({{ public_path()."/fonts/OpenSans-Italic.ttf" }}) format("truetype");
            font-weight: normal;
            font-style: italic;
        }
        @font-face {
            font-family: 'OpenSans';
            src: url({{ public_path()."/fonts/OpenSans-Light.ttf" }}) format("truetype");
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'OpenSans';
            src: url({{ public_path()."/fonts/OpenSans-LightItalic.ttf" }}) format("truetype");
            font-weight: normal;
            font-style: italic;
        }
        @font-face {
            font-family: 'OpenSans';
            src: url({{ public_path()."/fonts/OpenSans-Regular.ttf" }}) format("truetype");
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'OpenSans';
            src: url({{ public_path()."/fonts/OpenSans-SemiBold.ttf" }}) format("truetype");
            font-weight: bold;
            font-style: normal;
        }
        @font-face {
            font-family: 'OpenSans';
            src: url({{ public_path()."/fonts/OpenSans-SemiBoldItalic.ttf" }}) format("truetype");
            font-weight: bold;
            font-style: italic;
        }
        @page {
            margin: 0;
        }
        body {
            margin: 2em;
            font-family: "OpenSans" !important;
        }
        footer {
            background-color: {{ $data['primaryColor'] }}
        }
    </style>

</head>
<body>
<header>
    <div class="logo-container">
        <img class="img-fluid logo" src="{{ public_path()."/images/logos/".$data['logo'] }}" alt="logo">
    </div>
</header>
<footer>
    <table class="table">
        <tr>
            <td class="user-image">
                <img class="img-fluid avatar" src="{{ public_path()."/images/avatars/".$data['avatar'] }}" alt="avatar">
            </td>
            <td class="user-credential">
                <p class="user-name">{{ $data['name'] }}</p>
                <p>{{ $data['email'] }}</p>
                <p>{{ $data['phone'] }}</p>
            </td>
            <td class="footer-title">
                <h2>Get in touch <br> to get started!</h2>
            </td>
        </tr>
    </table>
</footer>
<main>
    {!! $data['htmlContent'] !!}
</main>
</body>
</html>
