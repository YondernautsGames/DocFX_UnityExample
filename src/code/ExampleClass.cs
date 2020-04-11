using UnityEngine;

namespace DocFX_Example
{
    /// <summary>
    /// This class only exists to demonstrate generating docs from C# comments
    /// </summary>
	public class ExampleClass : MonoBehaviour
	{
		public float floatValue = 5f;
		
        /// <summary>
        /// An example method. It does a thing
        /// </summary>
        /// <param name="count">The number of times to do the thing</param>
		public void DoSomething(int count)
		{
		}
	}
}
