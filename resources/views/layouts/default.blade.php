<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin RsCov</title>

    @stack('before-style')
    @include('includes.style')
    @stack('after-style')

</head>
<body id="page-top">
    @include('includes.sidebar')
    @include('includes.navbar')


    <!-- Begin Page Content -->
     <div class="container-fluid">

        @yield('content')

     </div>

    @stack('before-script')
    @include('includes.script')
    @stack('after-script')


</body>

</html>


