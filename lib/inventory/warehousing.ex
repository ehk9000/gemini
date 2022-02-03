defmodule Inventory.Warehousing do
  @moduledoc """
  The Warehousing context.
  """

  import Ecto.Query, warn: false
  alias Inventory.Repo

  alias Inventory.Warehousing.Company

  @doc """
  Returns the list of companies.

  ## Examples

      iex> list_companies()
      [%Company{}, ...]

  """
  def list_companies do
    Repo.all(Company)
  end

  @doc """
  Gets a single company.

  Raises `Ecto.NoResultsError` if the Company does not exist.

  ## Examples

      iex> get_company!(123)
      %Company{}

      iex> get_company!(456)
      ** (Ecto.NoResultsError)

  """
  def get_company!(id), do: Repo.get_by!(Company, id: id)

  @doc """
  Creates a company.

  ## Examples

      iex> create_company(%{field: value})
      {:ok, %Company{}}

      iex> create_company(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_company(attrs \\ %{}) do
    %Company{}
    |> Company.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a company.

  ## Examples

      iex> update_company(company, %{field: new_value})
      {:ok, %Company{}}

      iex> update_company(company, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_company(%Company{} = company, attrs) do
    company
    |> Company.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a company.

  ## Examples

      iex> delete_company(company)
      {:ok, %Company{}}

      iex> delete_company(company)
      {:error, %Ecto.Changeset{}}

  """
  def delete_company(%Company{} = company) do
    Repo.delete(company)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking company changes.

  ## Examples

      iex> change_company(company)
      %Ecto.Changeset{data: %Company{}}

  """
  def change_company(%Company{} = company, attrs \\ %{}) do
    Company.changeset(company, attrs)
  end

  alias Inventory.Warehousing.Warhouse

  @doc """
  Returns the list of warehouses.

  ## Examples

      iex> list_warehouses()
      [%Warhouse{}, ...]

  """
  def list_warehouses do
    Repo.all(Warhouse)
  end

  @doc """
  Gets a single warhouse.

  Raises `Ecto.NoResultsError` if the Warhouse does not exist.

  ## Examples

      iex> get_warhouse!(123)
      %Warhouse{}

      iex> get_warhouse!(456)
      ** (Ecto.NoResultsError)

  """
  def get_warhouse!(id), do: Repo.get!(Warhouse, id)

  @doc """
  Creates a warhouse.

  ## Examples

      iex> create_warhouse(%{field: value})
      {:ok, %Warhouse{}}

      iex> create_warhouse(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_warhouse(attrs \\ %{}) do
    %Warhouse{}
    |> Warhouse.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a warhouse.

  ## Examples

      iex> update_warhouse(warhouse, %{field: new_value})
      {:ok, %Warhouse{}}

      iex> update_warhouse(warhouse, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_warhouse(%Warhouse{} = warhouse, attrs) do
    warhouse
    |> Warhouse.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a warhouse.

  ## Examples

      iex> delete_warhouse(warhouse)
      {:ok, %Warhouse{}}

      iex> delete_warhouse(warhouse)
      {:error, %Ecto.Changeset{}}

  """
  def delete_warhouse(%Warhouse{} = warhouse) do
    Repo.delete(warhouse)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking warhouse changes.

  ## Examples

      iex> change_warhouse(warhouse)
      %Ecto.Changeset{data: %Warhouse{}}

  """
  def change_warhouse(%Warhouse{} = warhouse, attrs \\ %{}) do
    Warhouse.changeset(warhouse, attrs)
  end
end
