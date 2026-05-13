-- -------------------------------------------------------------------------- --
--                                                                            --
--                                                        :::      ::::::::   --
--   which-key.lua                                      :+:      :+:    :+:   --
--                                                    +:+ +:+         +:+     --
--   By: fmurat-- <fmurat--@student.42angouleme.fr  +#+  +:+       +#+        --
--                                                +#+#+#+#+#+   +#+           --
--   Created: 2026/05/13 14:35:14 by fmurat--          #+#    #+#             --
--   Updated: 2026/05/13 14:36:51 by fmurat--         ###   ########.fr       --
--                                                                            --
-- -------------------------------------------------------------------------- --

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- Les options par défaut fonctionnent très bien,
    -- mais vous pouvez personnaliser l'apparence ici.
    preset = "helix", -- moderne "classic", "helix"
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "All Keymaps",
    },
  },
}
