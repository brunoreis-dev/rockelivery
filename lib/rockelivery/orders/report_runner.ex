defmodule Rockelivery.Orders.ReportRunner do
  use GenServer

  require Logger

  alias Rockelivery.Orders.Report

  # Client

  def start_link(_initial_stack) do
    GenServer.start_link(__MODULE__, %{})
  end

  # Server

  @impl true
  def init(state) do
    Logger.info("Report Runner started")
    schedule_report_generator()
    {:ok, state}
  end

  @impl true
  def handle_info(:generate, state) do
    Logger.info("Generating report...")

    Report.create()
    schedule_report_generator()

    {:noreply, state}
  end

  def schedule_report_generator do
    Process.send_after(self(), :generate, 1000 * 60)
  end
end
