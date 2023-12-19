defmodule Crud do
  @pontos %{}

  def principal do
    loop()
  end

  def loop do
    IO.puts "Sistema Final"
    IO.puts "============="
    IO.puts "1. Criar"
    IO.puts "2. Listar"
    IO.puts "3. Atualizar"
    IO.puts "4. Excluir"
    IO.puts "5. Sair"

    IO.puts "Entre com sua opção: "
    opcao = IO.gets("") |> String.trim |> String.to_integer()

    case opcao do
      1 -> criar()
      2 -> listar()
      3 -> atualizar()
      4 -> excluir()
      5 -> sair()
      _ -> 
        IO.puts "Opção inválida. Tente novamente."
        loop()
    end
  end

  def criar do
    IO.puts "Opção Criar selecionada."
    IO.puts "Digite as coordenadas x e y separadas por espaço para o ponto (ex: 10 20):"
    _entrada = IO.gets("") |> String.trim |> String.split(" ") |> Enum.map(&String.to_integer/1)
    
    case _entrada do
      [x, y] ->
        @pontos = Map.put(@pontos, {x, y}, true)
        IO.puts "Ponto criado com sucesso!"
        loop()
      _ ->
        IO.puts "Entrada inválida. Tente novamente."
        criar()
    end
  end

  def listar do
    IO.puts "Opção Listar selecionada."
    IO.puts "Pontos cadastrados:"
    Enum.each(@pontos, fn {{x, y}, _} ->
      IO.puts "Ponto: {#{x}, #{y}}"
    end)
    loop()
  end

  def atualizar do
    IO.puts "Opção Atualizar selecionada."
    IO.puts "Digite as coordenadas x e y do ponto que deseja atualizar (ex: 10 20):"
    _entrada = IO.gets("") |> String.trim |> String.split(" ") |> Enum.map(&String.to_integer/1)
    
    case _entrada do
      [x, y] ->
        if Map.has_key?(@pontos, {x, y}) do
          IO.puts "Digite as novas coordenadas x e y para o ponto (ex: 30 40):"
          novas_coordenadas = IO.gets("") |> String.trim |> String.split(" ") |> Enum.map(&String.to_integer/1)
          
          case novas_coordenadas do
            [novo_x, novo_y] ->
              @pontos = Map.update!(@pontos, {x, y}, true, fn _ -> {novo_x, novo_y} end)
              IO.puts "Ponto atualizado com sucesso!"
              loop()
            _ ->
              IO.puts "Entrada inválida. Tente novamente."
              atualizar()
          end
        else
          IO.puts "Ponto não encontrado. Tente novamente."
          atualizar()
        end
      _ ->
        IO.puts "Entrada inválida. Tente novamente."
        atualizar()
    end
  end

  def excluir do
    IO.puts "Opção Excluir selecionada."
    IO.puts "Digite as coordenadas x e y do ponto que deseja excluir (ex: 10 20):"
    _entrada = IO.gets("") |> String.trim |> String.split(" ") |> Enum.map(&String.to_integer/1)
    
    case _entrada do
      [x, y] ->
        if Map.has_key?(@pontos, {x, y}) do
          @pontos = Map.delete!(@pontos, {x, y})
          IO.puts "Ponto excluído com sucesso!"
          loop()
        else
          IO.puts "Ponto não encontrado. Tente novamente."
          excluir()
        end
      _ ->
        IO.puts "Entrada inválida. Tente novamente."
        excluir()
    end
  end

  def sair do
    IO.puts "Sistema encerrado."
    :ok
  end
end