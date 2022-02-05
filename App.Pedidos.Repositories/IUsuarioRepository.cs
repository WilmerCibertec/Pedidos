using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using App.Pedidos.Models.DTO;

namespace App.Pedidos.Repositories
{
    public interface IUsuarioRepository : IRepository<WB_Usuario>
    {
        Task<WB_Usuario> BuscarPorId(int id);
        Task<IEnumerable<WB_Usuario>> Listar(string nombres);
        Task<int> Eliminar(int id);
        Task<WB_Usuario> ValidarUsuario(/*Usuario usuario*/ string email, string password);
        Task<MensajeRetorno> CrearUsuario(UsuarioD usuario);

        Task<int> ModificarUsuario(WB_Usuario entidad);

        Task<IEnumerable<WB_Usuario>> ListarIndice();

    }
}
