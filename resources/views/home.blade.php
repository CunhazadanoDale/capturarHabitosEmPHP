<h1>welcome to my first website</h1>

<p>Hello, {{ $name }}!</p>

<h2>Your Habits:</h2>

<ul>
    @foreach ($habits as $habit)
        <li>{{ $habit }}</li>
    @endforeach
</ul>


@auth
  <p>Você está logado</p>
@endauth

@guest
    <p>Você não está logado</p>
@endguest