# encoding: utf-8
################################################################################
## Initial developer: Massimo Maria Ghisalberti <massimo.ghisalberti@gmail.org>
## Date: 2017-03-02
## Company: Pragmas <contact.info@pragmas.org>
## Licence: Apache License Version 2.0, http://www.apache.org/licenses/
################################################################################

module MusicHelpers

  import org.jfugue.pattern.Pattern
  import org.jfugue.player.Player
  import org.jfugue.player.ManagedPlayer
  import org.jfugue.realtime.RealtimePlayer
  import org.jfugue.theory.ChordProgression
  import org.jfugue.theory.Note
  import org.jfugue.rhythm.Rhythm
  import org.staccato.ReplacementMapPreprocessor

  require 'task_helpers'

  class org.jfugue.player::Player

    include TaskHelpers

    attr_accessor :patterns

    def start
      if @patterns
        if stopped? || finished?
          task_run { play(@patterns) }
        end
      end
    end

    def started?
      get_managed_player.isStarted
    end

    def finished?
      get_managed_player.isFinished
    end

    def stopped?
      !playing?
    end

    def playing?
      get_managed_player.isPlaying
    end

    def paused?
      get_managed_player.isPaused
    end

    def pause
      get_managed_player.pause
    end

    def resume
      if paused?
        get_managed_player.resume
      else
        start
      end
    end

    def reset
      get_managed_player.reset
    end

    def finish
      get_managed_player.finish
    end

  end

  def create_music_player(patterns = nil)
    player = Player.new
    player.patterns = patterns
    player
  end

  def create_music_patterns(patterns)
    pattern = Pattern.new
    patterns.each { |ptn| pattern.add(ptn) }
    pattern
  end

  def create_music_rhythms(rhythms, opts = {})
    params = {
      :repeat => 1,
      :misure => 1
    }.deep_merge(opts)
    rhythm = Rhythm.new
    rhythms.each { |r| rhythm.add_layer(r) }
    rhythm.setLength(params[:misure])
    rhythm.get_pattern.repeat(params[:repeat])
  end

  def replacement_preprocessor(rules, patterns, opts = {})
    params = {
      :iteration => 1
    }.deep_merge(opts)
    rmp = ReplacementMapPreprocessor.getInstance
    rmp.setReplacementMap(rules)
    rmp.setIterations(params[:iteration])
    rmp.setRequireAngleBrackets(false)
    rmp.preprocess(patterns.to_s, nil)
    rmp
  end

end
