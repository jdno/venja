# frozen_string_literal: true

class HabitsController < ApplicationController
  before_action :set_habit, only: %i[edit update destroy]

  def index
    @habits = policy_scope(Habit)
  end

  def new
    @habit = authorize Habit.new
  end

  def edit
  end

  def create
    @habit = authorize Habit.new(habit_params.merge(user: current_user))

    if @habit.save
      redirect_to habits_url, notice: "Habit was successfully created."
    else
      render :new
    end
  end

  def update
    if @habit.update(habit_params)
      redirect_to habits_url, notice: "Habit was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @habit.destroy
    redirect_to habits_url, notice: "Habit was successfully destroyed."
  end

  private

  def set_habit
    @habit = authorize Habit.find_by!(uuid: params[:uuid])
  end

  def habit_params
    params.require(:habit).permit(:name)
  end
end
