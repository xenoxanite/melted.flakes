{...}: {
  programs.wofi.style = ''
    * {
     font-family: JetBrainsMono Nerd Font;
    }
    window {
      margin: 0px;
      border: 2px solid #595959;
      background-color: rgba(31, 31, 31, 0.95);
      border-radius: 0px;
    }
    #input {
      all: unset;
      min-height: 36px;
      padding: 4px 10px;
      margin: 4px;
      border: none;
      color: #e2e0ec;
      font-weight: bold;
      background-color: #595959;
      outline: none;
      border-radius: 0px;
      margin: 10px;
      margin-bottom: 2px;
    }

    #inner-box {
      margin: 4px;
      padding: 10px;
      font-weight: bold;
      border-radius: 0px;
    }

    #outer-box {
      margin: 0px;
      padding: 3px;
      border: none;
      border-radius: 0px;
      border: 2px solid #595959;
    }

    #scroll {
      margin-top: 5px;
      border: none;
      border-radius: 0px;
      margin-bottom: 5px;
    }

    #text:selected {
      color: #f1f0f5;
      margin: 0px 0px;
      border: none;
      border-radius: 0px;
    }

    #entry {
      margin: 0px 0px;
      border: none;
      border-radius: 0px;
      background-color: transparent;
    }

    #entry:selected {
      margin: 0px 0px;
      border: none;
      border-radius: 0px;
      background: #595959;
      /* background: linear-gradient(90deg, #E97193 0%, #82A497 100%); */
    }

  '';
}
