using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace listaTareas
{
    class tareas
    {

        public class listTareas
        {
            #region Propiedades
            public string Tarea { get; set; }
            public string Prioridad { get; set; }
            public string Estado { get; set; }
            #endregion

            #region Constructores
            public listTareas()
            {

            }

            public listTareas(string tarea, string prioridad, string estado)
            {
                Tarea = tarea;
                Prioridad = prioridad;
                Estado = estado;
            }
            #endregion

            #region Clases 
            public string getPrioridad(int clvPrioridad)
            {
                string prioridad = "";
                switch (clvPrioridad)
                {
                    case 0:
                        prioridad = "Undefined";
                        break;
                    case 1:
                        prioridad = "HIGH PRIORITY";
                        break;
                    case 2:
                        prioridad = "MEDIUM PRIORITY";
                        break;
                    case 3:
                        prioridad = "LOW PRIORITY";
                        break;
                    default:
                        break;
                }
                return prioridad;
            }

            public string getEstado(int clvEstado)
            {
                string estado = "";
                switch (clvEstado)
                {
                    case 0:
                        estado = "Undefined";
                        break;
                    case 1:
                        estado = "TO DO ";
                        break;
                    case 2:
                        estado = "IN PROGRESS";
                        break;
                    case 3:
                        estado = "COMPLETED";
                        break;
                    default:
                        break;
                }
                return estado;
            }
            #endregion

        }

        #region Clases
        public enum ePrioridad
        {
            Undefined,
            HP,
            MP,
            LP
        }

        public enum eEstado
        {
            Undefined,
            TD,
            IP,
            C
        }

        public static void MuestraResultado(List<listTareas> lista)
        {
            if (lista.Count != 0)
            {
                foreach (var item in lista)
                {
                    Console.WriteLine("Tarea: " + item.Tarea + " Prioridad: " + item.Prioridad + "  Estado: " + item.Estado);
                }
            }
            else
            {
                Console.WriteLine("La lista de tareas se encuentra vacia");
            }

        }

        #endregion

        public static void Main2(string[] args)
        {
            listTareas tareasMetodos = new listTareas();
            List<listTareas> tareas = new()
            {
                new("Enviar reporte semanal", tareasMetodos.getPrioridad((int)ePrioridad.HP), tareasMetodos.getEstado((int)eEstado.C)),
                new("Revisar correos pendientes", tareasMetodos.getPrioridad((int)ePrioridad.HP), tareasMetodos.getEstado((int)eEstado.IP)),
                new("Llamada de seguimiento con el cliente", tareasMetodos.getPrioridad((int)ePrioridad.MP), tareasMetodos.getEstado((int)eEstado.TD)),
                new("Preparar presentación para la reunión", tareasMetodos.getPrioridad((int)ePrioridad.LP), tareasMetodos.getEstado((int)eEstado.IP)),
                new("Actualizar inventario de productos", tareasMetodos.getPrioridad((int)ePrioridad.MP), tareasMetodos.getEstado((int)eEstado.C)),
            };

            Console.WriteLine("\nLista de Tareas");
                MuestraResultado(tareas);

            Console.WriteLine("\nOrdenar Tareas Por Prioridad");
            List<listTareas> orderbyTareasPrioridad = tareas.OrderBy(tarea => tarea.Prioridad).ToList();
            MuestraResultado(orderbyTareasPrioridad);

            Console.WriteLine("\nOrdenar tareas por estado");
            List<listTareas> orderbyTareasEstado = tareas.OrderBy(tarea => tarea.Estado).ToList();
            MuestraResultado(orderbyTareasEstado);

            Console.WriteLine("\nOrdenar tareas por prioridad y por estado");
            List<listTareas> orderbyTareasPrioridadEstado = 
                tareas.OrderBy(tarea => tarea.Prioridad)
                .ThenBy(tarea => tarea.Estado)
                .ToList();

                MuestraResultado(orderbyTareasPrioridadEstado);
            Console.WriteLine("\nMostrar tareas agrupadas por estado y su total");
            var groupByEstadoTotal = tareas.GroupBy(tarea => tarea.Estado)
                                    .Select(estadoTotal => new
                                    {
                                        Estado = estadoTotal.Key, 
                                        Total = estadoTotal.Count(),
                                        Tareas = estadoTotal.ToList()

                                    });
            foreach (var item in groupByEstadoTotal)
            {
                Console.WriteLine("Estado:" + item.Estado + ", Total de Tareas: " + item.Total);
                foreach (var tarea in item.Tareas)
                {
                    Console.WriteLine($" - {tarea.Tarea}");
                }
            }
            Console.WriteLine("\nMostrar tareas agrupadas por prioridad y su total");
            var groupByPrioridadTotal = tareas.GroupBy(tarea => tarea.Prioridad)
                                    .Select(prioridadTotal => new
                                    {
                                        Prioridad = prioridadTotal.Key,
                                        Total = prioridadTotal.Count(),
                                        Tareas = prioridadTotal.ToList()

                                    });
            foreach (var item in groupByPrioridadTotal)
            {
                Console.WriteLine("Prioridad:" + item.Prioridad + ", Total de Tareas: " + item.Total);
                foreach (var tarea in item.Tareas)
                {
                    Console.WriteLine($" - {tarea.Tarea}");
                }
            }

            Console.WriteLine("\nFiltrar tareas pendientes");
            List<listTareas> filtroPendientes = tareas.Where(tarea => tarea.Estado != tareasMetodos.getEstado((int)eEstado.C)).OrderBy(tarea=> tarea.Estado).ToList();
            MuestraResultado(filtroPendientes);

            Console.WriteLine("\nFiltrar tareas de prioridad alta");
            List<listTareas> filtroPrioridadAlta = tareas.Where(tarea => tarea.Prioridad == tareasMetodos.getPrioridad((int)ePrioridad.HP)).OrderBy(tarea => tarea.Prioridad).ToList();
            MuestraResultado(filtroPrioridadAlta);

            Console.WriteLine("\nListar tareas en progreso con prioridad alta");
            List<listTareas> enProgresoPrioridadAlta = tareas.Where(tarea => (tarea.Prioridad == tareasMetodos.getPrioridad((int)ePrioridad.HP)) && (tarea.Estado != tareasMetodos.getEstado((int)eEstado.C))).ToList();
            MuestraResultado(enProgresoPrioridadAlta);
        }

    }
}
