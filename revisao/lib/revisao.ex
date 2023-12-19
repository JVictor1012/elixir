defmodule Revisao do
  
  def hello do
    IO.puts "Hello world!"
  end

  def ola do
    IO.puts "Digite seu nome: "
    nome = IO.gets("") |> String.trim
    IO.puts "Olá #{nome}!"
  end

  def saudacao do
    IO.puts "Digite seu nome: "
    IO.puts "Digite seu aniversário: "
    nome = IO.gets("") |> String.trim
    aniversario = IO.gets("") |> String.trim |> String.to_integer

    idade = Date.utc_today().year - aniversario
    IO.puts "Olá #{nome}!, você tem #{idade} anos!"

  end

   def imc do
    IO.puts "Digite seu nome: "
    nome = IO.gets("") |> String.trim

    IO.puts "Digite seu peso em KG: "
    peso = IO.gets("") |> String.trim |> String.to_float

    IO.puts "Digite sua altura em cm: "
    altura_cm = IO.gets("") |> String.trim |> String.to_float

    altura_metros = altura_cm / 100

    imc = peso / (altura_metros * altura_metros)

    IO.puts "Olá, #{nome}! Seu IMC é #{imc}"
  end

  def inverso do
    IO.puts "Digite uma sequência de números: "
    numeros = IO.gets("") |> String.trim |> String.split(" ") |> Enum.reverse

    IO.puts "Sequência inversa é: #{Enum.join(numeros, ", ")}"
  end

  

end
