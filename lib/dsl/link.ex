defmodule Dsl.Link do
  alias Phoenix.HTML
  alias Dsl.Utils

  @moduledoc """
  This modules wraps all of the functions from the `Phoenix.HTML.Link` module to make them compatible with with Dsl.
  """

  @doc """
  Please see `Phoenix.HTML.Link.link/2` for details.
  """
  defmacro phx_link(opts, do: block) do
    quote do
      {:safe, content} =
        htm do
          unquote(block)
        end

      {:safe, link} = HTML.Link.link(content, unquote(opts))

      Utils.put_buffer(var!(buff, Dsl.Tags), link)
    end
  end

  defmacro phx_link(content, opts) do
    quote do
      {:safe, link} = HTML.Link.link(unquote_splicing([content, opts]))

      Utils.put_buffer(var!(buff, Dsl.Tags), link)
    end
  end

  @doc """
  Please see `Phoenix.HTML.Link.button/2` for details.
  """
  defmacro phx_button(opts, do: block) do
    quote do
      {:safe, content} =
        htm do
          unquote(block)
        end

      {:safe, link} = HTML.Link.button(content, unquote(opts))

      Utils.put_buffer(var!(buff, Dsl.Tags), link)
    end
  end

  defmacro phx_button(content, opts) do
    quote do
      {:safe, link} = HTML.Link.button(unquote_splicing([content, opts]))

      Utils.put_buffer(var!(buff, Dsl.Tags), link)
    end
  end
end